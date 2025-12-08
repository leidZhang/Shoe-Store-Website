import {useState, useEffect} from "react";
import {AiOutlineArrowLeft, AiOutlineArrowRight} from "react-icons/ai"
import { sliderData } from "./Slider-data";
import "./Slider.css"
import axios from "axios";
import {useNavigate, useParams} from "react-router-dom";


const Slider = () => {
    const [currentSlide, setCurrentSlide] = useState(0) //current slide starts from 0
    const slideLength = sliderData.length; //slideLength contains the length of the data array present in the slide data file (test = 3)
    const Scroll = true;
    let slideInterval;
    let intervalTime = 5000;

    //arrow key funtionality
    const nextSlide=()=>{
        setCurrentSlide(currentSlide === slideLength-1 ? 0: currentSlide+1);
    }
    const prevSlide=()=>{
        setCurrentSlide(currentSlide === 0 ? slideLength-1: currentSlide-1);
    }

    //auto Carasol effect
    function auto(){
        slideInterval = setInterval(nextSlide, intervalTime)

    }

    useEffect(() => {
        setCurrentSlide(0)
    }, []);



    useEffect(() => {
        if(Scroll)
        {
            auto();
        }
        return()=>clearInterval(slideInterval);
    }, [currentSlide]);
    
  //   const handleNavigate = (title) => {
  //      navigate(`http://localhost:3000/search-result?category=${title}`);
  //  }
    
    // 
    return(        
        <div className="Slider">
            <AiOutlineArrowLeft className="arrow prev"onClick={prevSlide}/>
            <AiOutlineArrowRight className="arrow next" onClick={nextSlide}/>
            {sliderData.map((slide, index) => {
                return (
                    <div className={index === currentSlide ? "slide current" : "slide"} key={index}>
                        {index === currentSlide && (
                            <>
                                <img src={slide.image} alt="slide" />
                                <div className="content">
                                    <h2>{slide.heading}</h2>
                                    <p>{slide.Des}</p>
                                    <hr/>
                                {/*<button className="button">Shop Now</button>*/}
                                </div>
                            </>
                        )}
                    </div>
                )
            })}
        </div>
    );
};

export default Slider