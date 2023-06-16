import React from "react";
import { createRoot } from "react-dom/client";
import {BrowserRouter as Router} from "react-router-dom";
import{ThirdwebProvider,ChainId} from "@thirdweb-dev/react";
import App from "./App";

const root = createRoot(document.getElementById("root"));

root.render(
    <ThirdwebProvider>
    <Router>
        <App/>
    </Router>
    </ThirdwebProvider>
)