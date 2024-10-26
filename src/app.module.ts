import { Module } from '@nestjs/common';
import { DatabaseModule } from './database/database.module';
import { TodoModule } from './todo/todo.module';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { PrizeModule } from './prize/prize.module';
import { TagModule } from './tag/tag.module';

@Module({
  imports: [DatabaseModule, TodoModule, UserModule, PrizeModule, TagModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
