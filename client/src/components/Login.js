import React, { useState } from 'react';
import { Link } from 'react-router-dom';

function Login({ setUserClient, setUserAdvocate }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [checkbox, setCheckbox] = useState(false);
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const loginLink = checkbox ? '/api/advocates/login' : '/api/clients/login';

  function handleSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    fetch(loginLink, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ email, password }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        r.json().then((user) => {
          checkbox ? setUserAdvocate(user) : setUserClient(user);
        });
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  return (
    <>
      <form onSubmit={handleSubmit}>
        <br />
        <br />
        <h1>Client/Advocate Login</h1>
        <label htmlFor='email'>email</label>
        <br />
        <input
          type='text'
          id='email'
          autoComplete='on'
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <br />
        <br />

        <label htmlFor='password'>Password</label>
        <br />
        <input
          type='password'
          id='password'
          autoComplete='current-password'
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <br />
        <label htmlFor='checkbox'>
          <input
            type='checkbox'
            id='checkbox'
            value={checkbox}
            onChange={() => setCheckbox(!checkbox)}
          />{' '}
          Log in as Advocate
        </label>
        <br />
        <br />

        <button type='submit'>{isLoading ? 'Loading...' : 'Login'}</button>

        {errors && errors.map((err) => <li key={err}>{err}</li>)}
      </form>
      <br />
      <hr style={{ width: '300px', marginLeft: 0 }} />
      <br />
      <span>
        Dont have an account?{' '}
        <Link to='/clients/signup'>
          <button>Sign Up</button>
        </Link>
      </span>
    </>
  );
}

export default Login;
