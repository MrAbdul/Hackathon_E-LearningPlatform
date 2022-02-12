import { BeforeInsert, BeforeUpdate, Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, Unique, UpdateDateColumn } from "typeorm";

@Entity()
export class Student {
  

    @PrimaryGeneratedColumn("uuid")
    id: string;

    @Column()
    @Unique('dublicate username',['usrname'])
    username:string
    @Column()
    password: string;


    

}

