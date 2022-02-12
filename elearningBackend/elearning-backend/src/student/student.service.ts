import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { Errors, ErrorSolutions } from 'src/constants';
import { Repository } from 'typeorm';
import { CreateStudentDto } from './dto/create-student.dto';
import { UpdateStudentDto } from './dto/update-student.dto';
import { Student } from './entities/student.entity';

@Injectable()
export class StudentService {
  constructor(@InjectRepository(Student) private repo: Repository<Student> 
    , private jwtService: JwtService, ) { }
  async create(createStudentDto: CreateStudentDto) {

      const user = this.repo.create(createStudentDto);
      await this.repo.save(user);
      
      const payload = { userId: user.id, authority: 1 };
      return { access_token: this.jwtService.sign(payload), userId: user.id, type:1 ,username:createStudentDto.username};
    }
  

  findAll() {
    return `This action returns all student`;
  }

  async findOne(username: string, password:string) {
    const user = await this.repo.findOne({where:{username:username}});
    if(user.password==password){
      const payload = { userId: user.id, authority: 1 };
      return { access_token: this.jwtService.sign(payload), userId: user.id,type:1, username:username }
    }else{
      throw new UnauthorizedException(ErrorSolutions.wrongPasswordOrEmailCombo, Errors.unauthenticated);

    }
  }

  update(id: number, updateStudentDto: UpdateStudentDto) {
    return `This action updates a #${id} student`;
  }

  remove(id: number) {
    return `This action removes a #${id} student`;
  }
}
