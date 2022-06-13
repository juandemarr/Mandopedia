<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('username', TextType::class,[
                'mapped' => true,
                'label' => 'Nombre de usuario',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Introduce tu nombre de usuario',
                    ]),
                ],
            ])

            ->add('email', EmailType::class,[
                'mapped'=>true,
                'label' => 'Correo electrónico',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Introduce tu email',
                    ]),
                ],
            ])

            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'label' => 'Contraseña (mínimo 6 caracteres)',
                'attr'=> [
                    'autocomplete' => 'new-password',
                ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Introduce una contraseña',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Debe tener al menos {{ limit }} caracteres',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])

            ->add('plainPassword2', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'label' => 'Repite la contraseña',
                'attr'=> [
                    'autocomplete' => 'new-password2',
                ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Las contraseñas deben coincidir',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Debe tener al menos {{ limit }} caracteres',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])

            ->add('firstname', TextType::class,[
                'mapped' => true,
                'label' => 'Nombre',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Introduce tu nombre',
                    ]),
                ],
            ])

            ->add('lastname', TextType::class,[
                'mapped' => true,
                'label' => 'Primer apellido',
                'constraints' => [
                    new NotBlank([
                        'message' => 'Introduce tu primer apellido',
                    ]),
                ],
            ])
            ->add('agreeTerms', CheckboxType::class, [
                'mapped' => false,
                'label' => 'Aceptar términos y condiciones',
                'constraints' => [
                    new IsTrue([
                        'message' => 'Hay que aceptar las condiciones de uso',
                    ]),
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
