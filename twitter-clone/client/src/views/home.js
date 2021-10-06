import React, {useEffect} from "react"
import axios from "axios"
import {Button} from "@material-ui/core"

export default function Home({history}){
    const handleclick=(page)=>{
        history.push(page)
    }
    return(
        <div className="home-view">
            <img className="home-img" src="https://wallpaperaccess.com/full/1459043.jpg" />
            <span className="title">Join Twitter Today  <Button variant="contained" color="primary" onClick={()=>handleclick("signup")} >Join</Button>  <Button color="primary" variant="contained" onClick={()=>handleclick("login")} >Login</Button></span>
        </div>
    )
}