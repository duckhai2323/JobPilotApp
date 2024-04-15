<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users',function (Blueprint $table){
            if (Schema::hasColumn('users','id')) {
                $table->dropColumn('id');
            }
            $table->mediumInteger('candidate_id');
            $table->primary('candidate_id')->autoIncrement();
            $table->renameColumn('email','candidate_email')->unique();
            $table->renameColumn('password','candidate_password');
            $table->renameColumn('name','candidate_name');
            $table->string('candidate_image')->nullable();
            $table->integer('status')->unsigned()->default(1);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users',function (Blueprint $table){
            $table->dropColumn('candidate_id');
            $table->renameColumn('candidate_email','email')->unique();
            $table->renameColumn('candidate_password','password');
            $table->renameColumn('candidate_name','name');
            $table->dropColumn(['candidate_image','status']);
        });
    }
};
