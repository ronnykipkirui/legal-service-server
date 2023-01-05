import React, { useState } from 'react';
import { Link } from 'react-router-dom';

function ClientSignUp({ setUserClient }) {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [passwordConfirmation, setPasswordConfirmation] = useState('');
  const [phone, setPhone] = useState('');
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  function handleSubmit(e) {
    e.preventDefault();
    setErrors([]);
    setIsLoading(true);
    fetch('/api/clients/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        name,
        email,
        password,
        password_confirmation: passwordConfirmation,
        phone,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        r.json().then((user) => setUserClient(user));
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
        <h1>Client Sign Up</h1>
        <label htmlFor='name'>Name</label>
        <br />
        <input
          type='text'
          id='name'
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
        <br />
        <br />

        <label htmlFor='email'>email</label>
        <br />
        <input
          type='email'
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
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          autoComplete='current-password'
        />
        <br />
        <br />

        <label htmlFor='password'>Password Confirmation</label>
        <br />
        <input
          type='password'
          id='password_confirmation'
          value={passwordConfirmation}
          onChange={(e) => setPasswordConfirmation(e.target.value)}
          autoComplete='current-password'
        />
        <br />
        <br />

        <label htmlFor='phone'>Phone</label>
        <br />
        <input
          type='text'
          name='phone'
          id='phone'
          value={phone}
          onChange={(e) => setPhone(e.target.value)}
        />
        <br />
        <br />

        <button type='submit'>{isLoading ? 'Loading...' : 'Sign Up'}</button>

        {errors && errors.map((err) => <li key={err}>{err}</li>)}
      </form>
      <br />
      <hr style={{ width: '300px', marginLeft: 0 }} />
      <br />
      <span>
        Have an account?{' '}
        <Link to='/clSign Upients/login'>
          <button>Log in</button>
        </Link>
      </span>
    </>
  );
}

export default ClientSignUp;
