import express from 'express';
import { supplierController } from '../controllers/supplier.controller';

const router = express.Router();

router.post('/create', supplierController.create);
router.get('/getAll', supplierController.getAll);
router.get('/:id', supplierController.getById);
router.put('/update/:id', supplierController.update);
router.delete('/delete/:id', supplierController.delete);
export default router;
