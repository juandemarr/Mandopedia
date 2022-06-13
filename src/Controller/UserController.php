<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

#[Route('/user')]
class UserController extends AbstractController
{
    /* #[Route('/', name: 'app_user_index', methods: ['GET'])]
    public function index(UserRepository $userRepository): Response
    {
        return $this->render('user/index.html.twig', [
            'users' => $userRepository->findAll(),
        ]);
    } */
    /*
    #[Route('/new', name: 'app_user_new', methods: ['GET', 'POST'])]
    public function new(Request $request, UserRepository $userRepository): Response
    {
        $user = new User();
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $userRepository->add($user);
            return $this->redirectToRoute('app_user_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('user/new.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }
    */
    
    /*
    #[Route('/{id}', name: 'app_user_show', methods: ['GET'])]
    public function show(User $user): Response
    {
        return $this->render('user/show.html.twig', [
            'user' => $user,
        ]);
    }
    */
    
    #[Route('/{id}/edit', name: 'app_user_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, User $user, UserRepository $userRepository, SluggerInterface $slugger, UserPasswordHasherInterface $userPasswordHasher, $id): Response
    {
        if (!$this->getUser()) {
            return $this->redirectToRoute('main');
        }

        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted()) {
            if($form->isValid()){
                $imageFile = $form->get('imageProfile')->getData();
                // this condition is needed because the field is not required
                // so the file must be processed only when a file is uploaded
                if ($imageFile) {
                    $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
                    // this is needed to safely include the file name as part of the URL
                    $safeFilename = $slugger->slug($originalFilename);
                    $newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();
                    // Move the file to the directory where they are stored
                    try {
                        $imageFile->move(
                            $this->getParameter('images_directory'),
                            $newFilename
                        );
                    } catch (FileException $e) {
                        return $this->redirectToRoute('app_user_edit',["id"=> $id ,"error" => "No se ha podido subir la imágen"]);
                    }

                    $user->setImage("/database-img/".$newFilename);
                }
                if($form->get('plainPassword')->getData() != "" && $form->get('plainPassword2')->getData() != ""){
                    if($form->get('plainPassword')->getData() == $form->get('plainPassword2')->getData()){
                        $user->setPassword(
                            $userPasswordHasher->hashPassword(
                                    $user,
                                    $form->get('plainPassword')->getData()
                                )
                            );
                    }else
                        return $this->redirectToRoute('app_user_edit',["id"=> $id ,"error" => "Las contraseñas deben coincidir"]);
                }

                //With this if there is an image but the password isn't correct, the entity user doesn't savewhile existing some error.
                $userRepository->add($user);
                return $this->redirectToRoute('app_main', [], Response::HTTP_SEE_OTHER);

            }else
                return $this->redirectToRoute('app_user_edit', ["id"=> $id ,"error" => "Uno o más campos son inválidos"], Response::HTTP_SEE_OTHER);
        }
        

        if(isset($_GET["error"])) //come from a redirectToRoute
            $error = $_GET["error"];
        else $error = null;


        return $this->renderForm('user/edit.html.twig', [
            'user' => $user,
            'form' => $form,
            'error' => $error,
        ]);
    }

    #[Route('/{id}', name: 'app_user_delete', methods: ['POST'])]
    public function delete(Request $request, User $user, UserRepository $userRepository, SessionInterface $session, $id): Response
    {
        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {

            $img = $userRepository->findImageById($user->getId())->getImage();
            $fs = new Filesystem(); //Para borrar el archivo fisico 

            try{
                $fs->remove($this->getParameter('images_directory').'/'.$img);
            }catch(FileException $e){

            }
            $currentUserId = $this->getUser()->getId();
            if ($currentUserId == $id){
                
                $this->get('security.token_storage')->setToken(null);
                $userRepository->remove($user);
                $session->invalidate();//for exiting the actual session
            }else{
                $userRepository->remove($user);
            }

            
        }

        return $this->redirectToRoute('app_main', [], Response::HTTP_SEE_OTHER);
    }
}
