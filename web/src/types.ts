export interface ToDoItem {
  id: string;
  task: string;
  completed: boolean;
  description?: string;
  updatedAt: string;
  prize?: Prize;
  tags?: Tag[];
}

export interface Prize {
  id: string;
  name: string;
  description?: string;
  cost: number;
}

export interface Tag {
  id: string;
  name: string;
  description?: string;
}

export interface User {
  id: string;
  username: string;
  email: string;
  toDoItems: ToDoItem[];
}
