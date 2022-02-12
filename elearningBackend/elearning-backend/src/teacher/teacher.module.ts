import { Module } from '@nestjs/common';
import { TeacherService } from './teacher.service';
import { TeacherController } from './teacher.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Teacher } from './entities/teacher.entity';
import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule ,ConfigService} from '@nestjs/config';

@Module({
  imports: [TypeOrmModule.forFeature([Teacher]),PassportModule,
  JwtModule.registerAsync({
    imports: [ConfigModule],
    useFactory: async () => ({
      secret: process.env.JWT_SECRET,
    }),
    inject: [ConfigService],
    
  }),
],
  controllers: [TeacherController],
  providers: [TeacherService]
})
export class TeacherModule {}
