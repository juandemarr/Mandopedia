<?php

namespace App\Controller\Admin;

use App\Entity\Publication;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;

class PublicationCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Publication::class;
    }

    /* public function createEntity(string $entityFqcn) {
        $entity = new Publication();
        $entity->setAuthor($this->getUser());
        return $entity;
    } //with this each publication has the author that has loggued in, but if we delete that user, we can't change it in the publication
    */

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->setPermission(Action::NEW, 'ROLE_WRITTER')
            ->setPermission(Action::INDEX, 'ROLE_WRITTER')
            ->setPermission(Action::DETAIL, 'ROLE_WRITTER')
            ->setPermission(Action::DELETE, 'ROLE_ADMIN')
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
            ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Publicación')
            ->setEntityLabelInPlural('Publicaciones')
            ->setSearchFields(['namePublication']);
    }

    
    public function configureFields(string $pageName): iterable
    {
        $user = $this->getUser();

        return [
            IntegerField::new('id', 'ID')->hideWhenCreating(), //both edit and new pages
            TextField::new('namePublication', 'Nombre')->setColumns(8),
            TextareaField::new('textPublication', 'Texto')->setColumns(8),
            ImageField::new('imagePublication', 'Ruta de imágen')->setUploadDir('/img/publication/')->setBasePath('/img/publication/')
            ->hideOnForm()->setColumns(8), //the image that show in index and detail, need a different path from new and edit
            ImageField::new('imagePublication', 'Ruta de imágen')->setUploadDir('/public/img/publication/')->setBasePath('/public/img/publication/')
            ->onlyWhenUpdating()->setFormTypeOptions([
                'required' => false, //allows to update without having to select the same image again
            ])->setColumns(8), 
            ImageField::new('imagePublication', 'Ruta de imágen')->setUploadDir('/public/img/publication/')->setBasePath('/public/img/publication/')
            ->onlyWhenCreating()->setFormTypeOptions([
                'required' => true, //the image on new must be required
            ])->setColumns(8),
            AssociationField::new('category', 'Category')->setColumns(8),
            //TextField::new('author','Autor')->setFormTypeOption('disabled','disabled')->setColumns(8),
            AssociationField::new('author', 'Autor')->setColumns(8)
        ];
    }
   
}
