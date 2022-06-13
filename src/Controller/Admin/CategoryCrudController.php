<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;

class CategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Category::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
            ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Categoría')
            ->setEntityLabelInPlural('Categorías')
            ->setSearchFields(['nameCategory']);
    }
    
    public function configureFields(string $pageName): iterable
    {
        return [
            IntegerField::new('id', 'ID')->hideWhenCreating(), //both edit and new pages
            TextField::new('nameCategory', 'Nombre')->setColumns(8),
            TextareaField::new('descriptionCategory', 'Descripción')->setColumns(8),
            ImageField::new('imageCategory', 'Ruta de imágen')->setUploadDir('/img/category/')->setBasePath('/img/category/')
            ->hideOnForm()->setColumns(8), //the image that show in index and detail, need a different path from new and edit
            ImageField::new('imageCategory', 'Ruta de imágen')->setUploadDir('/public/img/category/')->setBasePath('/public/img/category/')
            ->onlyWhenUpdating()->setFormTypeOptions([
                'required' => false, //allows to update without having to select the same image again
            ])->setColumns(8),
            ImageField::new('imageCategory', 'Ruta de imágen')->setUploadDir('/public/img/category/')->setBasePath('/public/img/category/')
            ->onlyWhenCreating()->setFormTypeOptions([
                'required' => true, //the image on new must be required
            ])->setColumns(8),
        ];
    }
    
}
