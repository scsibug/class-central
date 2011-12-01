<?php

namespace ClassCentral\SiteBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilder;

class OfferingType extends AbstractType
{
    public function buildForm(FormBuilder $builder, array $options)
    {
        $builder
            ->add('startDate')
            ->add('endDate')
            ->add('exactDatesKnow')
            ->add('course',null,array('property'=>'name'))   
            ->add('url')    
            ->add('videoIntro')      
        ;
    }

    public function getName()
    {
        return 'classcentral_sitebundle_offeringtype';
    }
}
