import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class TodoService {
  constructor(private readonly databaseService: DatabaseService) {}

  async create(createTodoDto: Prisma.ToDoItemCreateInput) {
    return this.databaseService.toDoItem.create({ data: createTodoDto });
  }

  async findAll() {
    return this.databaseService.toDoItem.findMany({});
  }

  async findOne(id: string) {
    return this.databaseService.toDoItem.findUnique({ where: { id } });
  }

  async update(id: string, updateTodoDto: Prisma.ToDoItemUpdateInput) {
    return this.databaseService.toDoItem.update({
      where: { id },
      data: updateTodoDto,
    });
  }

  async remove(id: string) {
    return this.databaseService.toDoItem.delete({ where: { id } });
  }
}
