import React,{useState,useEffect} from "react"
import TextField from '@material-ui/core/TextField';
import {Button} from '@material-ui/core';
import axios from "axios"
import getCookie from "../functions/getCookies"

export default function Login({history}){
    const [user,setUser] = useState({username:"",password:""})
    const handleclick=()=>{
        //console.log(user)
        if(user.username === "" || user.password === "") {console.log("return");return}
        axios.post("/login/",{"username":user.username,"password":user.password},{
            headers:{
                "Content-type":"application/json",
                "X-CSRFToken":getCookie("csrftoken")
            }
        }).then(res=>{
            if (res.status === 200){
                if(res.data.msg === "success"){
                    history.push(res.data.redirect)
                }
                else{
                    alert("Invalid username or password")
                }
            }
        }).catch(e=>console.log(e))
    }
    const handleChange = (e)=>{
        setUser({
            ...user,
            [e.target.name]:e.target.value
        })
    }
    return(
        <div className="login-view" onSubmit={e=>e.preventDefault()}>
            <form className="form" onChange={handleChange}>
                <TextField className="TextField" label="Username" variant="outlined" name="username" />
                <TextField className="TextField" label="Password" variant="outlined" type="password" name="password" />
                <Button color="primary" variant="contained" onClick={()=>handleclick("login")} >Login</Button>
            </form>
        </div>
    )
}