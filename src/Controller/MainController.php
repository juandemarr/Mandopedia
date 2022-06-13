<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\CategoryRepository;
use App\Repository\ModificationRepository;
use App\Repository\PublicationRepository;
use Symfony\Component\HttpFoundation\Request;

class MainController extends AbstractController
{
    #[Route('/', name: 'app_main')]
    public function index(CategoryRepository $categoryRepo, ModificationRepository $modificationRepo): Response
    {
        if($this->isGranted("ROLE_ADMIN") or $this->isGranted("ROLE_WRITTER")){
            $allModifications = $modificationRepo->getNotSavedModifications();
        }else $allModifications = null;

        $categories = $categoryRepo->findAll();
        
        return $this->render('main/index.html.twig', [
            'controller_name' => 'MainController',
            'categories' => $categories,
            'allModifications' => $allModifications
        ]);
    }

    #[Route('/search', name: 'app_search')]
    public function search(Request $request, PublicationRepository $publicationRepo): Response
    {
        $text = $request->get('search');

        $publications = $publicationRepo->searchByName($text);
        
        return $this->render('main/searchResults.html.twig', [
            'controller_name' => 'MainController',
            'publications' => $publications
        ]);
    }

    #[Route('/privacy', name: 'app_privacy')]
    public function privacy(): Response
    {        
        return $this->render('main/privacy.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }

    #[Route('/cookies', name: 'app_cookies')]
    public function cookies(): Response
    {        
        return $this->render('main/cookies.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }

    #[Route('/terms', name: 'app_terms')]
    public function terms(): Response
    {        
        return $this->render('main/terms.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }

    #[Route('/about-us', name: 'app_about_us')]
    public function aboutUs(): Response
    {        
        return $this->render('main/aboutUs.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }
}
