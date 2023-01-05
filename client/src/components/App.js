import React, { useEffect, useState } from "react";
import { Switch, Route } from "react-router-dom";
import NavBar from "./NavBar";
import Login from "./Login";
import ClientSignUp from "./ClientSignUp";
import AdvocateSignUp from "./AdvocateSignUp";

function App() {
  const [userClient, setUserClient] = useState(null);
  const [userAdvocate, setUserAdvocate] = useState(null);
  // console.log(userClient)

  useEffect(() => {
    // CLIENT auto-login
    fetch('/api/clients/me').then((r) => {
      if (r.ok) {
        r.json().then((user) => setUserClient(user));
      }
    });
  }, []);

  useEffect(() => {
    // ADVOCATE auto-login
    fetch('/api/advocates/me').then((r) => {
      if (r.ok) {
        r.json().then((user) => setUserAdvocate(user));
      }
    });
  }, []);

  return (
    <>
      <NavBar userClient={userClient} setUserClient={setUserClient} userAdvocate={userAdvocate} setUserAdvocate={setUserAdvocate} />
      <main>
        <Switch>
          <Route exact path='/login'>
            <Login setUserClient={setUserClient} setUserAdvocate={setUserAdvocate} />
          </Route>
          <Route exact path='/clients/signup'>
            <ClientSignUp setUserClient={setUserClient} />
          </Route>
          <Route exact path="/advocates/signup">
            <AdvocateSignUp setUserAdvocate={setUserAdvocate} />
          </Route>
          <Route path="*"><h1>Page Not Found</h1></Route>
        </Switch>
      </main>
    </>
  );
}

export default App;
