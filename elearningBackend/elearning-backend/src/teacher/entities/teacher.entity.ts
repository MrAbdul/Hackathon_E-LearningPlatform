import { Column, Entity, PrimaryGeneratedColumn, Unique } from "typeorm";

@Entity()
export class Teacher {

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    @Unique('dublicate Teacher username',['usrname'])
    username:string
    @Column()
    password: string;

}
