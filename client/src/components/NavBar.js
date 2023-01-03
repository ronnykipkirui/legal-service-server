import React from 'react';
import { Link } from 'react-router-dom';

function NavBar({ userClient, setUserClient, userAdvocate, setUserAdvocate }) {
  // IF ELSEIF ELSE STATEMENT
  // https://stackoverflow.com/questions/38810843/how-can-i-write-an-else-if-structure-using-react-jsx-the-ternary-is-not-expr
  function handleLogoutClick() {
    // eslint-disable-next-line
    {
      userClient
        ? fetch('/api/clients/logout', {
            method: 'DELETE',
          }).then((r) => {
            if (r.ok) {
              setUserClient(null);
            }
          })
        : userAdvocate
        ? fetch('/api/advocates/logout', {
            method: 'DELETE',
          }).then((r) => {
            if (r.ok) {
              setUserAdvocate(null);
            }
          })
        : alert('Not authorized!');
    }
  }

  return (
    <>
      {userClient || userAdvocate ? (
        <button onClick={handleLogoutClick}>Logout</button>
      ) : (
        <>
          <Link to='/login'>
            <button>Client Login</button>
          </Link>{' '}
          <Link to='/clients/signup'>
            <button>Client Signup</button>
          </Link>
          <h3>OR</h3>
          <Link to='/login'>
            <button>Advocate Login</button>
          </Link>{" "}
          <Link to='/advocates/signup'>
            <button>Advocate SignUp</button>
          </Link>
        </>
      )}
      <br />
      <br />
      {userClient
        ? `Hi ${userClient.name}! Logged in a client!`
        : userAdvocate
        ? `Hi ${userAdvocate.name}! Logged in as Advocate!`
        : 'Not logged in!'}
        <hr />
    </>
  );
}

export default NavBar;
