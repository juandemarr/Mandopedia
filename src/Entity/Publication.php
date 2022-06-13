<?php

namespace App\Entity;

use App\Repository\PublicationRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Security\Core\Security;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PublicationRepository::class)]
class Publication
{
    /**
     * @var Security
     */
    private $security;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255, unique: true)]
    private $namePublication;

    #[ORM\Column(type: 'string', length: 5000)]
    private $textPublication;

    #[ORM\Column(type: 'string', length: 255)]
    private $imagePublication;

    #[ORM\ManyToOne(targetEntity: Category::class, inversedBy: 'publications')]
    #[ORM\JoinColumn(nullable: false)]
    private $category;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'publications')]
    #[ORM\JoinColumn(nullable: false)]
    private $author;

    #[ORM\OneToMany(mappedBy: 'post', targetEntity: Modification::class, orphanRemoval: true)]
    private $modifications;

    public function __construct()
    {
        $this->modifications = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->namePublication;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNamePublication(): ?string
    {
        return $this->namePublication;
    }

    public function setNamePublication(string $namePublication): self
    {
        $this->namePublication = $namePublication;

        return $this;
    }

    public function getTextPublication(): ?string
    {
        return $this->textPublication;
    }

    public function setTextPublication(string $textPublication): self
    {
        $this->textPublication = $textPublication;

        return $this;
    }

    public function getImagePublication(): ?string
    {
        return $this->imagePublication;
    }

    public function setImagePublication(string $imagePublication): self
    {
        $this->imagePublication = $imagePublication;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getAuthor(): ?User
    {
        return $this->author;
    }

    public function setAuthor(?User $author): self
    {
        $this->author = $author;

        return $this;
    }

    /**
     * @return Collection<int, Modification>
     */
    public function getModifications(): Collection
    {
        return $this->modifications;
    }

    public function addModification(Modification $modification): self
    {
        if (!$this->modifications->contains($modification)) {
            $this->modifications[] = $modification;
            $modification->setPublication($this);
        }

        return $this;
    }

    public function removeModification(Modification $modification): self
    {
        if ($this->modifications->removeElement($modification)) {
            // set the owning side to null (unless already changed)
            if ($modification->getPublication() === $this) {
                $modification->setPublication(null);
            }
        }

        return $this;
    }
}
