import { Button } from '@mui/material';
import { User } from './types';
import { useState } from 'react';

function App() {
  const [user, setUser] = useState<User | null>(null);

  const login = (userData : User) => {
    setUser(userData);
  };

  if (!user) {
    return (
      
    )
  }



  return (
    <>
      <p>Hello {user?.username}</p>
      <Button variant="contained">Button Text</Button>
    </>
  );
}

export default App;
