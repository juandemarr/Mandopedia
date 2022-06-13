<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoryRepository::class)]
class Category
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $nameCategory;

    #[ORM\Column(type: 'string', length: 255)]
    private $descriptionCategory;

    #[ORM\OneToMany(mappedBy: 'category', targetEntity: Publication::class)]
    private $publications;

    #[ORM\Column(type: 'string', length: 255)]
    private $imageCategory;


    public function __construct()
    {
        $this->publications = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->nameCategory;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameCategory(): ?string
    {
        return $this->nameCategory;
    }

    public function setNameCategory(string $nameCategory): self
    {
        $this->nameCategory = $nameCategory;

        return $this;
    }

    public function getDescriptionCategory(): ?string
    {
        return $this->descriptionCategory;
    }

    public function setDescriptionCategory(string $descriptionCategory): self
    {
        $this->descriptionCategory = $descriptionCategory;

        return $this;
    }

    /**
     * @return Collection<int, Publication>
     */
    public function getPublications(): Collection
    {
        return $this->publications;
    }

    public function addPublication(Publication $publication): self
    {
        if (!$this->publications->contains($publication)) {
            $this->publications[] = $publication;
            $publication->setIdCategory($this);
        }

        return $this;
    }

    public function removePublication(Publication $publication): self
    {
        if ($this->publications->removeElement($publication)) {
            // set the owning side to null (unless already changed)
            if ($publication->getIdCategory() === $this) {
                $publication->setIdCategory(null);
            }
        }

        return $this;
    }

    public function getImageCategory(): ?string
    {
        return $this->imageCategory;
    }

    public function setImageCategory(string $imageCategory): self
    {
        $this->imageCategory = $imageCategory;

        return $this;
    }

}
