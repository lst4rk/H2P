import React, { useState, useEffect } from 'react';
import axios from "axios";
import Ask from '../components/Ask';
import {Link} from 'react-router-dom';

function Home() {
    const [asks, setAsks] = useState(null)
    function loadAsks() {
        axios
            .get("/api/version1/asks")
            .then((res) => {
                setAsks(res.data)
            })
            .catch((err) => console.log(err))
    }

    useEffect(() => {
        loadAsks()
    }, [])

    return (
        <div>
            <Link to="/new">
                <button
                    className="text-3xl uppercase p-4 border grow-0 max-w-fit hover:bg-white hover:border-black hover:bg-opacity-70 hover:text-black">
                    New
                </button>
            </Link>
            {asks !== null && (
                <ul className="grid grid-cols-3 gap-3 py-6">
                    { asks.map(ask => <Ask key={ask.id} {...ask}/>) }
                </ul>
            )}
        </div>
    )
}

export default Home;