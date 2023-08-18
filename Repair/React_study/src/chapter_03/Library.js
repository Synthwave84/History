import React from "react";
import Book from "./Book"

function Library () {
  return (
    <div>
      <Book name="자바" numOfPage={300}/>
      <Book name="스프링" numOfPage={500}/>
      <Book name="오라클" numOfPage={700}/>
    </div>
  );
}
export default Library;