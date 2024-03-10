package controller

import (
	"github.com/kataras/iris/v12"
	"tp_iris/model"
)

func GetMarketEmoData(ctx iris.Context) {
	emotion_info := model.ME_Field{}
	res := emotion_info.Queryall()
	ctx.JSON(res)
}

type DateRang struct {
	StartDate string `json:"startDate"`
	EndDate   string `json:"endDate"`
}

func DateRangeData(ctx iris.Context) {
	emotion_info := model.ME_Field{}
	reqArg := &DateRang{}

	if err := ctx.ReadJSON(reqArg); err != nil {
		panic(err.Error())
	}

	res := emotion_info.QueryData_By_DateRange(reqArg.StartDate, reqArg.EndDate)
	ctx.JSON(res)
}

func AddMarketEmoData(ctx iris.Context) {
	marketEmoFromData := &model.ME_Field{}

	if err := ctx.ReadJSON(marketEmoFromData); err != nil {
		panic(err.Error())
	}

	ctx.JSON(marketEmoFromData.InsertData(*marketEmoFromData))

}
