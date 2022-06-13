<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions
            ->disable('new')//the users are created in the register only
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
            ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setEntityLabelInSingular('Usuario')
            ->setEntityLabelInPlural('Usuarios')
            ->setSearchFields(['username', 'firstname', 'lastname', 'email']);
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IntegerField::new('id','ID')->hideOnForm(), //both edit and new pages
            TextField::new('username', 'Nombre de usuario')->setColumns(8),
            TextField::new('firstname', 'Nombre')->setColumns(8),
            TextField::new('lastname', 'Apellido')->setColumns(8),
            EmailField::new('email', 'Correo electrónico')->setColumns(8),
            ArrayField::new('roles', 'Roles')->setColumns(8),
        ];
    }
   
}
/* 

    
    public function configureFields(string $pageName): iterable
    {
        $id = IntegerField::new('id');
        $username = TextField::new('username', 'Nombre de usuario');
        $firstname = TextField::new('firstname', 'Nombre');
        $lastname = TextField::new('lastname', 'Apellido');
        $email = EmailField::new('email', 'Nombre');
        $image = TextField::new('image', 'Ruta imágen');
        $roles = ArrayField::new('roles', 'Roles');
        
        if (Crud::PAGE_INDEX === $pageName) {
            return [$id, $username, $firstname, $lastname, $email, $image, $roles];
        } elseif (Crud::PAGE_DETAIL === $pageName) {
            return [$id, $username, $firstname, $lastname, $email, $image, $roles];
        } elseif (Crud::PAGE_NEW === $pageName) {
            return [$username, $firstname, $lastname, $email, $image, $roles];
        }elseif (Crud::PAGE_EDIT === $pageName) {
            return [$username, $firstname, $lastname, $email, $image, $roles];
        }
    } */
