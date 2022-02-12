import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Errors, ErrorSolutions } from 'src/constants';
import { Repository } from 'typeorm';
import { CreateTeacherDto } from './dto/create-teacher.dto';
import { UpdateTeacherDto } from './dto/update-teacher.dto';
import { Teacher } from './entities/teacher.entity';

@Injectable()
export class TeacherService {
  constructor(@InjectRepository(Teacher) private repo: Repository<Teacher> 
    , private jwtService: JwtService, ) { }
  async create(createStudentDto: CreateTeacherDto) {

      const user = this.repo.create(createStudentDto);
      await this.repo.save(user);
      
      const payload = { userId: user.id, authority: 2 };
      return { access_token: this.jwtService.sign(payload), userId: user.id ,type:2,username:createStudentDto.username};
    }
  

  findAll() {
    return `This action returns all student`;
  }

  async findOne(username: string, password:string) {
    const user = await this.repo.findOne({where:{username:username}});
    if(user.password==password){
      const payload = { userId: user.id, authority: 2 };
      return { access_token: this.jwtService.sign(payload), userId: user.id ,type:2,username:username}
    }else{
      throw new UnauthorizedException(ErrorSolutions.wrongPasswordOrEmailCombo, Errors.unauthenticated);

    }
  }

  update(id: number, updateTeacherDto: UpdateTeacherDto) {
    return `This action updates a #${id} teacher`;
  }

  remove(id: number) {
    return `This action removes a #${id} teacher`;
  }
}
