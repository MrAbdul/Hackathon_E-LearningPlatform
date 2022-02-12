import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { Student } from './student/entities/student.entity';
import { StudentModule } from './student/student.module';
import { Teacher } from './teacher/entities/teacher.entity';
import { TeacherModule } from './teacher/teacher.module';

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

      entities:[Student,Teacher]
  }),
    StudentModule,
    TeacherModule,
    ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
