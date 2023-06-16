import React from "react";
import './index.css';

const App = () => {
  return (
    <div>
      <div className="relative sm:-8 p-4 bg-[#13131a] min-h-screen flex flex-row text-white">
        <div className="sm:flex hidden mr-10 relative">
            sidebar
        </div>

        <div className="flex-1 max-sw:w-full max-w-[1280px] mx-auto sm:pr-5">
            navbar
        </div>
      </div>
    </div>
  );
};

export default App;
