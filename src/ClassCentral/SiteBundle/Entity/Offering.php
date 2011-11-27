<?php

namespace ClassCentral\SiteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * ClassCentral\SiteBundle\Entity\Offering
 */
class Offering {

    /**
     * @var integer $id
     */
    private $id;

    /**
     * @var date $startDate
     */
    private $startDate;

    /**
     * @var date $endDate
     */
    private $endDate;

    /**
     * @var boolean $exactDatesKnow
     */
    private $exactDatesKnow;

    /**
     * @var datetime $created
     */
    private $created;

    /**
     * @var datetime $modified
     */
    private $modified;

    /**
     * @var ClassCentral\SiteBundle\Entity\Course
     */
    private $course;
    
    /**
     *
     * @var string $url
     */
    private $url;

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId() {
        return $this->id;
    }

    /**
     * Set startDate
     *
     * @param date $startDate
     */
    public function setStartDate($startDate) {
        $this->startDate = $startDate;
    }

    /**
     * Get startDate
     *
     * @return date 
     */
    public function getStartDate() {
        return $this->startDate;
    }

    /**
     * Set endDate
     *
     * @param date $endDate
     */
    public function setEndDate($endDate) {
        $this->endDate = $endDate;
    }

    /**
     * Get endDate
     *
     * @return date 
     */
    public function getEndDate() {
        return $this->endDate;
    }

    /**
     * Set exactDatesKnow
     *
     * @param boolean $exactDatesKnow
     */
    public function setExactDatesKnow($exactDatesKnow) {
        $this->exactDatesKnow = $exactDatesKnow;
    }

    /**
     * Get exactDatesKnow
     *
     * @return boolean 
     */
    public function getExactDatesKnow() {
        return $this->exactDatesKnow;
    }

    /**
     * Set created
     *
     * @param datetime $created
     */
    public function setCreated($created) {
        $this->created = $created;
    }

    /**
     * Get created
     *
     * @return datetime 
     */
    public function getCreated() {
        return $this->created;
    }

    /**
     * Set modified
     *
     * @param datetime $modified
     */
    public function setModified($modified) {
        $this->modified = $modified;
    }

    /**
     * Get modified
     *
     * @return datetime 
     */
    public function getModified() {
        return $this->modified;
    }

    /**
     * Set course
     *
     * @param ClassCentral\SiteBundle\Entity\Course $course
     */
    public function setCourse(\ClassCentral\SiteBundle\Entity\Course $course) {
        $this->course = $course;
    }

    /**
     * Get course
     *
     * @return ClassCentral\SiteBundle\Entity\Course 
     */
    public function getCourse() {
        return $this->course;
    }

    public function __construct() {
        $this->instructors = new ArrayCollection();
    }

    public function getFormattedStartDate() {
        if ($this->getExactDatesKnow()) {
            $format = 'jS M, Y';
        } else {
            $format = 'M, Y';
        }
        
        return $this->getStartDate()->format($format);
    }
    
    public function getUrl(){
        return $this->url;        
    }
    
    public function setUrl($url){
        $this->url = $url;
    }

}