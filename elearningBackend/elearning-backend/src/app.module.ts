import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { StudentModule } from './student/student.module';

@Module({
  imports: [ConfigModule.forRoot({
    isGlobal:true,
  }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port:Number(process.env.DB_PORT),
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      autoLoadEntities: false,
      synchronize: true,
      ssl:process.env.ENVIRONMENT=="dev"?false:{rejectUnauthorized:false,},
      // entities: [__dirname + '/../**/*.entity.{js,ts}']

      entities:[]
  }),
    StudentModule,
    ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
