<?php

namespace ClassCentral\SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ClassCentral\SiteBundle\Entity\Instructor;
use ClassCentral\SiteBundle\Form\InstructorType;

/**
 * Instructor controller.
 *
 */
class InstructorController extends Controller
{
    /**
     * Lists all Instructor entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entities = $em->getRepository('ClassCentralSiteBundle:Instructor')->findAll();

        return $this->render('ClassCentralSiteBundle:Instructor:index.html.twig', array(
            'entities' => $entities
        ));
    }

    /**
     * Finds and displays a Instructor entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('ClassCentralSiteBundle:Instructor')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Instructor entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ClassCentralSiteBundle:Instructor:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),

        ));
    }

    /**
     * Displays a form to create a new Instructor entity.
     *
     */
    public function newAction()
    {
        $entity = new Instructor();
        $form   = $this->createForm(new InstructorType(), $entity);

        return $this->render('ClassCentralSiteBundle:Instructor:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView()
        ));
    }

    /**
     * Creates a new Instructor entity.
     *
     */
    public function createAction()
    {
        $entity  = new Instructor();
        $request = $this->getRequest();
        $form    = $this->createForm(new InstructorType(), $entity);
        $form->bindRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getEntityManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('instructor_show', array('id' => $entity->getId())));
            
        }

        return $this->render('ClassCentralSiteBundle:Instructor:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView()
        ));
    }

    /**
     * Displays a form to edit an existing Instructor entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('ClassCentralSiteBundle:Instructor')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Instructor entity.');
        }

        $editForm = $this->createForm(new InstructorType(), $entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ClassCentralSiteBundle:Instructor:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Edits an existing Instructor entity.
     *
     */
    public function updateAction($id)
    {
        $em = $this->getDoctrine()->getEntityManager();

        $entity = $em->getRepository('ClassCentralSiteBundle:Instructor')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Instructor entity.');
        }

        $editForm   = $this->createForm(new InstructorType(), $entity);
        $deleteForm = $this->createDeleteForm($id);

        $request = $this->getRequest();

        $editForm->bindRequest($request);

        if ($editForm->isValid()) {
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('instructor_edit', array('id' => $id)));
        }

        return $this->render('ClassCentralSiteBundle:Instructor:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Instructor entity.
     *
     */
    public function deleteAction($id)
    {
        $form = $this->createDeleteForm($id);
        $request = $this->getRequest();

        $form->bindRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getEntityManager();
            $entity = $em->getRepository('ClassCentralSiteBundle:Instructor')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Instructor entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('instructor'));
    }

    private function createDeleteForm($id)
    {
        return $this->createFormBuilder(array('id' => $id))
            ->add('id', 'hidden')
            ->getForm()
        ;
    }
}
