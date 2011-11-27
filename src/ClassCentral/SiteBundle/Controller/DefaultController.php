<?php

namespace ClassCentral\SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use ClassCentral\SiteBundle\Entity\Course;

class DefaultController extends Controller {

    public function indexAction() {

        $now = new \DateTime;   
        
        // Ongoing
        $query = $this->getDoctrine()->getEntityManager()->createQueryBuilder();
        $query->add('select', 'o')
                ->add('from', 'ClassCentralSiteBundle:Offering o')
                ->add('where', 'o.startDate < :datetime')
                ->setParameter('datetime', $now->format("Y-m-d"))
        ;
        $ongoing = $query->getQuery()->getResult();

        
        // Upcoming
        $query = $this->getDoctrine()->getEntityManager()->createQueryBuilder();
        $query->add('select', 'o')
                ->add('from', 'ClassCentralSiteBundle:Offering o')
                ->add('where', 'o.startDate > :datetime')
                ->setParameter('datetime', $now->format("Y-m-d"))
        ;
        $upcoming = $query->getQuery()->getResult();

        // Get some stats
        $stats['courses'] = $this->getDoctrine()->getEntityManager()->createQuery('SELECT COUNT(c.id) FROM ClassCentralSiteBundle:Course c')->getSingleScalarResult();
        $stats['instructors'] = $this->getDoctrine()->getEntityManager()->createQuery('SELECT COUNT(i.id) FROM ClassCentralSiteBundle:Instructor i')->getSingleScalarResult();
                
        return $this->render('ClassCentralSiteBundle:Default:index.html.twig', array('ongoing' => $ongoing,'upcoming'=>$upcoming, 'stats' => $stats));
    }

}
