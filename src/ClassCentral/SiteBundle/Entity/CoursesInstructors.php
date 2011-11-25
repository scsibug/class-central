<?php

namespace ClassCentral\SiteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ClassCentral\SiteBundle\Entity\CoursesInstructors
 */
class CoursesInstructors
{
    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var ClassCentral\SiteBundle\Entity\Courses
     */
    private $course;

    /**
     * @var ClassCentral\SiteBundle\Entity\Instructors
     */
    private $instructor;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set course
     *
     * @param ClassCentral\SiteBundle\Entity\Courses $course
     */
    public function setCourse(\ClassCentral\SiteBundle\Entity\Courses $course)
    {
        $this->course = $course;
    }

    /**
     * Get course
     *
     * @return ClassCentral\SiteBundle\Entity\Courses 
     */
    public function getCourse()
    {
        return $this->course;
    }

    /**
     * Set instructor
     *
     * @param ClassCentral\SiteBundle\Entity\Instructors $instructor
     */
    public function setInstructor(\ClassCentral\SiteBundle\Entity\Instructors $instructor)
    {
        $this->instructor = $instructor;
    }

    /**
     * Get instructor
     *
     * @return ClassCentral\SiteBundle\Entity\Instructors 
     */
    public function getInstructor()
    {
        return $this->instructor;
    }
}