<?php

namespace App\Controller;

use App\Entity\Publication;
use App\Form\PublicationType;
use App\Repository\PublicationRepository;
use App\Repository\ModificationRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

#[Route('/publication')]
class PublicationController extends AbstractController
{
    /* #[Route('/', name: 'app_publication_index', methods: ['GET'])]
    public function index(PublicationRepository $publicationRepository): Response
    {
        return $this->render('publication/index.html.twig', [
            'publications' => $publicationRepository->findAll(),
        ]);
    } */

    /* #[Route('/new', name: 'app_publication_new', methods: ['GET', 'POST'])]
    public function new(Request $request, PublicationRepository $publicationRepository): Response
    {
        $publication = new Publication();
        $form = $this->createForm(PublicationType::class, $publication);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $publicationRepository->add($publication);
            return $this->redirectToRoute('app_publication_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('publication/new.html.twig', [
            'publication' => $publication,
            'form' => $form,
        ]);
    } */

    #[Route('/update/{idPost}/{idModification}', name: 'app_publication_update', methods: ['GET'])]
    public function update(EntityManagerInterface $em, PublicationRepository $repoPost, ModificationRepository $repoMod, $idPost, $idModification):Response
    {
        if($this->isGranted("ROLE_WRITTER")){
            $mod = $repoMod->find($idModification);
            $textMod = $mod->getTextModification();
            $repoPost->updatePublication($idPost,$textMod);
            $mod->setSaved(true);
            $em->persist($mod);
            $em->flush();

            return new Response();
        }else $this->redirectToRoute("app_main");
    }

    #[Route('/{id}', name: 'app_publication_show', methods: ['GET'])]
    public function show(Publication $publication): Response
    {
        if(isset($_GET['warning']))
            $warning = $_GET['warning'];
        else $warning = null;
        
        if(isset($_GET["error"]))
            $error = $_GET["error"];
        else $error = null;

        return $this->render('publication/show.html.twig', [
            'publication' => $publication,
            "warning" => $warning,
            "error" => $error,
        ]);
    } 

    /* #[Route('/{id}', name: 'app_publication_delete', methods: ['POST'])]
    public function delete(Request $request, Publication $publication, PublicationRepository $publicationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$publication->getId(), $request->request->get('_token'))) {
            $publicationRepository->remove($publication);
        }

        return $this->redirectToRoute('app_publication_index', [], Response::HTTP_SEE_OTHER);
    } */
}
