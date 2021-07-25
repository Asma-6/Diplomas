<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(LaratrustSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(FormulaireSeeder::class);
        $this->call(EtudiantsTableSeeder::class);
        $this->call(DemandesTableSeeder::class); 
        $this->call(DiplomesTableSeeder::class); 
    }

}
