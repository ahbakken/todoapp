import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class TagService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createTagDto: Prisma.TagCreateInput) {
    return this.databaseService.tag.create({ data: createTagDto });
  }

  findAll() {
    return this.databaseService.tag.findMany({});
  }

  findOne(id: string) {
    return this.databaseService.tag.findUnique({ where: { id } });
  }

  update(id: string, updateTagDto: Prisma.TagUpdateInput) {
    return this.databaseService.tag.update({
      where: { id },
      data: updateTagDto,
    });
  }

  remove(id: string) {
    return this.databaseService.tag.delete({ where: { id } });
  }
}
