package model

import (
	"fmt"
	"log"
	db "tp_iris/databases"
)

// MarketEmotionSQL example.

type ME_Field struct {
	Date string `json:"date"`
	Lbs  int    `json:"lbs"`
	Bd   string `json:"bd"`
	Sjzt int    `json:"sjzt"`
	Sjdt int    `json:"sjdt"`
}

func (this *ME_Field) Queryall() (emotion_data []ME_Field) {
	emotion_data = make([]ME_Field, 0)
	table_name := "marketemo"

	rows, err := db.MySql.Query(fmt.Sprintf(
		" select * from (SELECT * FROM %s ORDER BY date DESC LIMIT 60) AS que ORDER BY date ASC", table_name))
	var res ME_Field
	if err != nil {
		log.Fatalln("db.MySql.Query : ", err)
	}

	defer rows.Close()

	for rows.Next() {

		rows.Scan(&res.Date, &res.Lbs, &res.Bd, &res.Sjzt, &res.Sjdt)
		emotion_data = append(emotion_data, res)
	}

	return emotion_data
}

func (this *ME_Field) QueryData_By_DateRange(startDate string, endDate string) (emotion_data []ME_Field) {
	emotion_data = make([]ME_Field, 0)
	table_name := "marketemo"
	sql := fmt.Sprintf("SELECT * FROM %s WHERE date >= '%s' AND date <= '%s'", table_name, startDate, endDate)
	rows, err := db.MySql.Query(sql)
	var res ME_Field
	if err != nil {
		log.Fatalln("db.MySql.Query : ", err)
	}

	defer rows.Close()

	for rows.Next() {

		rows.Scan(&res.Date, &res.Lbs, &res.Bd, &res.Sjzt, &res.Sjdt)
		emotion_data = append(emotion_data, res)
	}

	return emotion_data
}

func (this *ME_Field) InsertData(data ME_Field) (state bool) {

	table_name := "marketemo"
	stmt, err := db.MySql.Prepare(fmt.Sprintf(
		"INSERT INTO %s(date, lbs, bd, sjzt, sjdt) VALUES (?,?,?,?,?)", table_name))
	if err != nil {
		panic(err.Error())
	}
	defer stmt.Close()

	_, err = stmt.Exec(data.Date, data.Lbs, data.Bd, data.Sjzt, data.Sjdt)
	if err != nil {
		panic(err.Error())
		return false
	}

	return true
}
