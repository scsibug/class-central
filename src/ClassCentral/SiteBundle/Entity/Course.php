<?php

namespace ClassCentral\SiteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * ClassCentral\SiteBundle\Entity\Course
 */
class Course {

    public function __construct() {

        $this->offerings = new ArrayCollection();
        $this->instructors = new ArrayCollection();
    }

    /**
     * @var integer $id
     */
    private $id;

    /**
     * Get id
     *
     * @return integer 
     */
    public function getId() {
        return $this->id;
    }

    /**
     * @var string $name
     */
    private $name;

    /**
     * @var date $start_date
     */
    private $start_date;

    /**
     * @var boolean $exact_date_known
     */
    private $exact_date_known;

    /**
     * @var integer $stream_id
     */
   // private $stream_id;

    /**
     * @var ClassCentral\SiteBundle\Entity\Stream
     */
    private $stream;
    protected $offerings;    

    /**
     * Set name
     *
     * @param string $name
     */
    public function setName($name) {
        $this->name = $name;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName() {
        return $this->name;
    }

    /**
     * Set start_date
     *
     * @param date $startDate
     */
    public function setStartDate($startDate) {
        $this->start_date = $startDate;
    }

    /**
     * Get start_date
     *
     * @return date 
     */
    public function getStartDate() {
        return $this->start_date;
    }

    /**
     * Set exact_date_known
     *
     * @param boolean $exactDateKnown
     */
    public function setExactDateKnown($exactDateKnown) {
        $this->exact_date_known = $exactDateKnown;
    }

    /**
     * Get exact_date_known
     *
     * @return boolean 
     */
    public function getExactDateKnown() {
        return $this->exact_date_known;
    }

    /**
     * Set stream
     *
     * @param ClassCentral\SiteBundle\Entity\Stream $stream
     */
    public function setStream(\ClassCentral\SiteBundle\Entity\Stream $stream) {
        $this->stream = $stream;
        $stream->setCourses($this);
    }

    /**
     * Get stream
     *
     * @return ClassCentral\SiteBundle\Entity\Stream 
     */
    public function getStream() {
        return $this->stream;
    }

    private $instructors;

    public function getInstructors() {
        return $this->instructors;
    }

    public function getOfferings() {
        return $this->offerings;
    }

}