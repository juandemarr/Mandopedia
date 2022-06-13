<?php

namespace App\Entity;

use App\Repository\ModificationRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ModificationRepository::class)]
class Modification
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 5000)]
    private $textModification;

    #[ORM\ManyToOne(targetEntity: User::class, inversedBy: 'modifications')]
    #[ORM\JoinColumn(nullable: false)]
    private $author;

    #[ORM\ManyToOne(targetEntity: Publication::class, inversedBy: 'modifications')]
    #[ORM\JoinColumn(nullable: false)]
    private $post;

    #[ORM\Column(type: 'boolean')]
    private $saved;

    #[ORM\Column(type: 'string', length: 5000)]
    private $newText;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTextModification(): ?string
    {
        return $this->textModification;
    }

    public function setTextModification(string $textModification): self
    {
        $this->textModification = $textModification;

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

    public function getPost(): ?Publication
    {
        return $this->post;
    }

    public function setPost(?Publication $post): self
    {
        $this->post = $post;

        return $this;
    }

    public function getSaved(): ?bool
    {
        return $this->saved;
    }

    public function setSaved(bool $saved): self
    {
        $this->saved = $saved;

        return $this;
    }

    public function getNewText(): ?string
    {
        return $this->newText;
    }

    public function setNewText(string $newText): self
    {
        $this->newText = $newText;

        return $this;
    }
}
