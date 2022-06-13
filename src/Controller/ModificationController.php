<?php

namespace App\Controller;

use App\Entity\Modification;
use App\Form\ModificationType;
use App\Repository\ModificationRepository;
use App\Entity\Publication;
use App\Form\PublicationType;
use App\Repository\PublicationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/modification')]
class ModificationController extends AbstractController
{
    #[Route('/', name: 'app_modification_index', methods: ['GET'])]
    public function index(ModificationRepository $modificationRepository): Response
    {
        if($this->isGranted("ROLE_WRITTER")){

            return $this->render('modification/index.html.twig', [
                'modifications' => $modificationRepository->getNotSavedModifications(),
            ]);
        }
        else return $this->redirectToRoute('app_main');
    }

    #[Route('/new/{id}', name: 'app_modification_new', methods: ['GET', 'POST'])]
    public function new(Publication $publication, Request $request, PublicationRepository $publicationRepository, ModificationRepository $modificationRepository): Response
    {
      if($this->isGranted("ROLE_USER")){
        
        $modification = new Modification();
        
        if(isset($_POST["textModification"])){

            $textPost = $publication->getTextPublication();
            $textMod = $_POST["textModification"];

            $firstIndex = strlen($textPost);
            for($i = 0, $j = 0; $i < strlen($textPost) and $j < strlen($textMod) ; $i++, $j++){
                if($textPost[$i] != $textMod[$j]){
                    $firstIndex = $i;
                    break;
                }
            }

            for($i = strlen($textPost) - 1, $j = strlen($textMod) - 1; $i >= 0, $j >=0 ; $i--, $j--){
                if($textPost[$i] != $textMod[$j]){
                    $lastIndex = $j;
                    break;
                }
            }

            $newText = substr($textMod,$firstIndex);
            $newText = substr($newText, 0, $lastIndex - $firstIndex + 1);

            $modification->setNewText($newText);
            $modification->setTextModification($_POST["textModification"]);
            $modification->setAuthor($this->getUser());
            $modification->setPost($publication);
            $modification->setSaved(false);

            $modificationRepository->add($modification);
            return $this->redirectToRoute('app_publication_show', ["id"=>$publication->getId(), "warning" => "Tu modificación espera la validación de un administrador"], Response::HTTP_SEE_OTHER);
        }
        return $this->redirectToRoute('app_publication_show', ["id"=>$publication->getId(), "error"=>"No se han podido guardar tus cambios"], Response::HTTP_SEE_OTHER);
    
      }else return $this->redirectToRoute('app_main');

    }

    /* #[Route('/{id}', name: 'app_modification_show', methods: ['GET'])]
    public function show(Modification $modification): Response
    {
      if($this->isGranted("ROLE_ADMIN"))
        return $this->render('modification/show.html.twig', [
            'modification' => $modification,
        ]);
      else return $this->redirectToRoute('app_main');
    } */

    /* #[Route('/{id}/edit', name: 'app_modification_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Modification $modification, ModificationRepository $modificationRepository): Response
    {
        $form = $this->createForm(ModificationType::class, $modification);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $modificationRepository->add($modification);
            return $this->redirectToRoute('app_modification_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('modification/edit.html.twig', [
            'modification' => $modification,
            'form' => $form,
        ]);
    } */

    #[Route('/{id}', name: 'app_modification_delete', methods: ['POST'])]
    public function delete(Request $request, Modification $modification, ModificationRepository $modificationRepository): Response
    {
        if($this->isGranted("ROLE_WRITTER")){
            if ($this->isCsrfTokenValid('delete'.$modification->getId(), $request->request->get('_token'))) {
                $modificationRepository->remove($modification);
            }

            return $this->redirectToRoute('app_modification_index', [], Response::HTTP_SEE_OTHER);
        }else $this->redirectToRoute("app_main");
    }
}
