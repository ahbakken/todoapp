import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class PrizeService {
  constructor(private readonly databaseService: DatabaseService) {}

  create(createPrizeDto: Prisma.PrizeCreateInput) {
    return this.databaseService.prize.create({ data: createPrizeDto });
  }

  findAll() {
    return this.databaseService.prize.findMany({});
  }

  findOne(id: string) {
    return this.databaseService.prize.findUnique({ where: { id } });
  }

  update(id: string, updatePrizeDto: Prisma.PrizeUpdateInput) {
    return this.databaseService.prize.update({
      where: { id },
      data: updatePrizeDto,
    });
  }

  remove(id: string) {
    return this.databaseService.prize.delete({ where: { id } });
  }
}
