import Person from '../models/person.model';
import { IPerson } from '../interfaces/person.interface';

class PersonService {
  async create(data: Partial<IPerson>): Promise<IPerson> {
    return Person.create(data);
  }

  async getAll(): Promise<IPerson[]> {
    return Person.findAll();
  }
    
  async getById(id: string): Promise<IPerson | null> {
    try {
      return await Person.findByPk(id);
    } catch (error: any) {
      throw new Error('Error al buscar la persona por ID: ' + error.message);
    }
  }
  
  async update(id: string, data: Partial<IPerson>): Promise<IPerson | null> {
    try {
      const person = await Person.findByPk(id);
      if (!person) {
        throw new Error('No se encontró la persona con el ID especificado.');
      }
      await person.update(data);
      return person;
    } catch (error: any) {
      throw new Error('Error al actualizar la persona: ' + error.message);
    }
  }
  
  async delete(id: string): Promise<boolean> {
    try {
      const result = await Person.destroy({ where: { PersonID: id } });
      if (result === 0) {
        throw new Error('No se encontró la persona con el ID especificado para eliminar.');
      }
      return true;
    } catch (error: any) {
      throw new Error('Error al eliminar la persona: ' + error.message);
    }
  }
}

export const personService = new PersonService();
