<?php

namespace ClassCentral\StaticBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction()
    {
        return $this->render('ClassCentralStaticBundle:Default:index.html.twig', array());
    }
}
