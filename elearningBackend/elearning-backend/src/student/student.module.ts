import { Module } from '@nestjs/common';
import { StudentService } from './student.service';
import { StudentController } from './student.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Student } from './entities/student.entity';
import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule,ConfigService } from '@nestjs/config';

@Module({
  imports: [TypeOrmModule.forFeature([Student]),PassportModule,
  JwtModule.registerAsync({
    imports: [ConfigModule],
    useFactory: async () => ({
      secret: process.env.JWT_SECRET,
    }),
    inject: [ConfigService],
    
  }),
],
  controllers: [StudentController],
  providers: [StudentService]
})
export class StudentModule {}
