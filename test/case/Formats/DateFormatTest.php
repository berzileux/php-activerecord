<?php

#[\AllowDynamicProperties]
class DateFormatTest extends DatabaseTest
{

	public function test_datefield_gets_converted_to_ar_datetime()
	{
		//make sure first author has a date
		$author = Author::first();
		$author->some_date = new DateTime();
		$author->save();

		//this is buggy way to retrieve first record it might return a different record
		//$refetch_author = Author::first()
		$refetch_author = Author::first( array('author_id' => $author->id ) );

		//$this->assert_is_a(ActiveRecord\DateTime::class,$author->some_date);
		//assert_is_a = instanceOf
		$this->assertInstanceOf(ActiveRecord\DateTime::class,$refetch_author->some_date);
	}

}
?>
