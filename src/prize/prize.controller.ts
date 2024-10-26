import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { PrizeService } from './prize.service';
import { Prisma } from '@prisma/client';

@Controller('prize')
export class PrizeController {
  constructor(private readonly prizeService: PrizeService) {}

  @Post()
  create(@Body() createPrizeDto: Prisma.PrizeCreateInput) {
    return this.prizeService.create(createPrizeDto);
  }

  @Get()
  findAll() {
    return this.prizeService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.prizeService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updatePrizeDto: Prisma.PrizeUpdateInput,
  ) {
    return this.prizeService.update(id, updatePrizeDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.prizeService.remove(id);
  }
}
