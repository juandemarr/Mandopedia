<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Security\EmailVerifier;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mime\Address;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;
use App\Repository\UserRepository;

class RegistrationController extends AbstractController
{
    private EmailVerifier $emailVerifier;

    public function __construct(EmailVerifier $emailVerifier)
    {
        $this->emailVerifier = $emailVerifier;
    }

    #[Route('/register', name: 'app_register')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager): Response
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('main');
        }

        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            if($form->get('plainPassword')->getData() == $form->get('plainPassword2')->getData()){
                // encode the plain password
                $user->setPassword(
                $userPasswordHasher->hashPassword(
                        $user,
                        $form->get('plainPassword')->getData()
                    )
                );
                $user->setRoles(["ROLE_USER"]);
                $user->setImage('/img/defaultProfile.png');
                $user->setIsVerified(true);
                $entityManager->persist($user);
                $entityManager->flush();
                /*
                try{
                    // generate a signed url and email it to the user
                    $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
                        (new TemplatedEmail())
                            ->from(new Address('mando.mandopedia@gmail.com', 'Mandopedia - Admin'))
                            ->to($user->getEmail())
                            ->subject('Por favor verifica tu email de Mandopedia')
                            ->htmlTemplate('registration/confirmation_email.html.twig')
                    );
                    // do anything else you need here, like send an email

                }catch(\Exception $e){ //in case there isn't an internet connection
                    $entityManager->remove($user);
                    $entityManager->flush();
                    
                    // for the validation on js the fields must be focused, so better is to redirectToRoute
                    return $this->redirectToRoute('app_register',["error" => "No se ha podido enviar el correo electrónico de verificación"]);
                    
                }
                
                return $this->redirectToRoute('app_login',["warning" => "Se ha enviado un enlace de verificación a tu correo electrónico"]);
                */
                return $this->redirectToRoute('app_login',["info" => "¡Ya puedes iniciar sesión!"]);
            }else{
                return $this->redirectToRoute('app_register',["error" => "Las contraseñas deben coincidir"]);
            }
        }
        
        if(isset($_GET["error"])) //come from a redirectToRoute
            $error = $_GET["error"];
        else $error = null;
        
        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
            'error' => $error,
        ]);
    }

    #[Route('/verify/email', name: 'app_verify_email')]
    public function verifyUserEmail(Request $request, TranslatorInterface $translator): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        // validate email confirmation link, sets User::isVerified=true and persists
        try {
            $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
        } catch (VerifyEmailExceptionInterface $exception) {
            //$this->addFlash('verify_email_error', $translator->trans($exception->getReason(), [], 'VerifyEmailBundle'));

            return $this->redirectToRoute('app_register',["error" => "No se ha podido verificar tu dirección de correo electrónico"]);
        }

        // @TODO Change the redirect on success and handle or remove the flash message in your templates
        //$this->addFlash('success', 'Tu dirección de email ha sido verificada');

        return $this->redirectToRoute('app_login',["info"=>"Tu dirección de correo electronico ha sido verificada con exito"]);
    }

    #[Route('/recover_password', name: 'app_recover_password')]
    public function recoverPassword(Request $request, UserPasswordHasherInterface $userPasswordHasher, MailerInterface $mailer, UserRepository $userRepo){
        
        if ($this->getUser()) {
            return $this->redirectToRoute('main');
        }

        if(isset($_GET['error']))
            $error = $_GET['error'];
        else $error = null;

        if (isset($_POST['recoverPasswordEmail'])) {    
        
            $user = $userRepo->findUserByEmail($_POST['recoverPasswordEmail']);
            $newPassword = substr(md5(microtime()), 1, 8);

            $email = (new TemplatedEmail())
            ->from(new Address('mando.mandopedia@gmail.com', 'Mandopedia - Admin'))
            ->to($_POST['recoverPasswordEmail'])
            ->subject('Recuperar la contraseña en Mandopedia')
            ->htmlTemplate('registration/recover_password_email.html.twig')
            // pass variables (name => value) to the template
            ->context([
                'password' => $newPassword,
            ]);
            /*
            try{
                $userRepo->upgradePassword($user,
                    $userPasswordHasher->hashPassword(
                            $user,
                            $newPassword
                        )
                    );
                $mailer->send($email);
            }catch(e){
                return $this->redirectToRoute('app_recover_password',["error"=>"No se ha podido enviar el correo de recuperación"]);
            }

            return $this->redirectToRoute('app_login',["info"=>"El correo de recuperación ha sido enviado"]);
            */
            return $this->redirectToRoute('app_login');
        }

        return $this->render('registration/recover_password.html.twig', [
            'error' => $error
        ]);
    }
}
