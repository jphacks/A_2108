package repository

import (
	"testing"

	"github.com/jphacks/A_2108/src/database"
)

func TestGetUserByID(t *testing.T) {
	db, err := database.NewDatabaseHandlerWithDBName("DAWN")
	if err != nil {
		t.Errorf("DB Open Error: %+v", err)
	}

	DriveAutoMigrate(db, t)

	err = DrivePostUser(db)
	if err != nil {
		t.Errorf("%+v", err)
	}

	err = DriveGetUserByID(db, 1)
	if err != nil && err.Error() != "Not Creator" {
		t.Errorf("%+v", err)
	}
}
