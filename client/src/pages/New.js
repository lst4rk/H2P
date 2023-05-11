import React, {useState} from 'react';
import axios from "axios";
import {useNavigate} from "react-router-dom";

function New() {
    const [title, setTitle] = useState("");
    const navigate = useNavigate();
    function handleSubmit(e) {
        e.preventDefault();
        axios
            .post("/api/version1/asks", {
                title: title})
            .then((res) => {
                console.log(res);
                navigate('/');
            })
    }

    const handleChange = (e) => {
        setTitle(e.target.value);
    }

    return (
        <>
            <form onSubmit={handleSubmit}>
                <label>
                    What's on your mind?
                    <input
                        type="text"
                        name="title"
                        value={title}
                        placeholder="What's on your mind?"
                        onChange={handleChange}
                        className="text-black"
                    />
                </label>
                <button type="submit">Send</button>
            </form>
        </>
    )
}

export default New;