import React,{useState} from "react"
import {TextField,Button} from "@material-ui/core"
import axios from "axios"
import getCookie from "../functions/getCookies"

export default function Signup({history}){
    const [user,setUser] = useState({"first_name":"","last_name":"","email":"","username":"","password":""})

    const handleChange = (e)=>{
        setUser(prev=>{
            return{
                ...prev,
                [e.target.name]:e.target.value
            }
        })
    }

    const handleChick = ()=>{
        //console.log(user)
        if (user.first_name !== "" && user.last_name !== "" && user.email !== "" && user.username !== "" && user.password !== ""){
            axios.post("/signup/",user,{
                headers:{
                    "Content-type":"application/json",
                    "X-CSRFToken":getCookie("csrftoken")
                }
            }).then(data=>{
                //console.log(data.data)
                if(data.data.msg === "success"){
                    history.replace(data.data.redirect)
                }else{
                    console.log(data.data.hint)
                }
            })
            .catch(e=>console.log(e))
        }
    }

    return(
        <div className="login-view" onSubmit={e=>e.preventDefault()}>
            <form onChange={handleChange} className="form">
                <TextField style={{marginBottom:20}} className="TextField" label="First Name" variant="outlined" name="first_name" />
                <TextField style={{marginBottom:20}} className="TextField" label="Last Name" variant="outlined" name="last_name" />
                <TextField style={{marginBottom:20}} className="TextField" label="Email" type="email" variant="outlined" name="email" />
                <TextField style={{marginBottom:20}} className="TextField" label="Username" variant="outlined" name="username" />
                <TextField style={{marginBottom:50}} className="TextField" label="Password" variant="outlined" type="password" name="password" />
                <Button color="primary" onClick={handleChick} variant="contained">Signup</Button>
            </form>
        </div>
    )
}