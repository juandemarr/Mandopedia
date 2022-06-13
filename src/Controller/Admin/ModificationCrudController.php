<?php

namespace App\Controller\Admin;

use App\Entity\Modification;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;

class ModificationCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Modification::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->disable('new')
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
            ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Modificación')
            ->setEntityLabelInPlural('Modificaciones')
            ->setSearchFields(['post.namePublication', 'author.username']);
    }
    
    public function configureFields(string $pageName): iterable
    {
        return [
            IntegerField::new('id','ID')->hideWhenUpdating(),
            TextareaField::new('textModification', 'Texto'),
            AssociationField::new('post', 'Publicación')->hideWhenUpdating(),
            AssociationField::new('author', 'Autor')->hideWhenUpdating(),
            BooleanField::new('saved','Aprobado'),
            TextareaField::new('newText', 'Edición')->hideWhenUpdating(),
        ];
    }
   
}
