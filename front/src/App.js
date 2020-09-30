import React, { useState, useEffect } from "react";
import axios from "axios";

import Grid from "@material-ui/core/Grid";
import TextField from "@material-ui/core/TextField";
import Select from "@material-ui/core/Select";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import Typography from "@material-ui/core/Typography";
import Card from "@material-ui/core/Card";
import Star from "@material-ui/icons/Star";
import StarBorder from "@material-ui/icons/StarBorder";

import { Logo, Input, Item, padding, marginBottom } from "./styles";

const BASE_URL = "http://localhost:3000";

export default () => {
  const [search, setSearch] = useState({
    term: "",
    query: {},
  });

  const [result, setResult] = useState({
    results: [],
    total: 0,
    stars_avg: 0,
    oldest: 0,
    newest: 0,
    subjects_count: 0,
  });

  const [subjects, setSubjects] = useState([]);

  const handleSearch = async () => {
    const response = await axios.post(`${BASE_URL}/websites`, {
      term: search.term,
      query: search.query,
    });

    setResult(response.data);
  };

  const getSubjects = async () => {
    const response = await axios.get(`${BASE_URL}/subjects`);

    setSubjects(response.data);
  };

  useEffect(() => {
    handleSearch();
    getSubjects();
  }, []);

  useEffect(() => {
    handleSearch();
  }, [search]);

  return (
    <Grid container justify="center" alignItems="center" style={padding}>
      <Logo src="/gugou.png" />

      <Grid
        item
        container
        spacing={3}
        direction="row"
        justify="center"
        alignItems="center"
        style={marginBottom}
      >
        <Grid item>
          <Card variant="outlined" style={padding}>
            <Typography variant="subtitle1">
              <b>Avaliação média</b>
            </Typography>
            <Typography variant="body1">{result.stars_avg}</Typography>
          </Card>
        </Grid>
        <Grid item>
          <Card variant="outlined" style={padding}>
            <Typography variant="subtitle1">
              <b>Assuntos</b>
            </Typography>
            <Typography variant="body1">{result.subjects_count}</Typography>
          </Card>
        </Grid>
        <Grid item>
          <Card variant="outlined" style={padding}>
            <Typography variant="subtitle1">
              <b>Quantidade</b>
            </Typography>
            <Typography variant="body1">{result.total}</Typography>
          </Card>
        </Grid>
        <Grid item>
          <Card variant="outlined" style={padding}>
            <Typography variant="subtitle1">
              <b>Mais recente</b>
            </Typography>
            <Typography variant="body1">{result.newest || "Nenhum"}</Typography>
          </Card>
        </Grid>
        <Grid item>
          <Card variant="outlined" style={padding}>
            <Typography variant="subtitle1">
              <b>Mais antigo</b>
            </Typography>
            <Typography variant="body1">{result.oldest || "Nenhum"}</Typography>
          </Card>
        </Grid>
      </Grid>

      <Grid
        item
        container
        justify="center"
        alignItems="center"
        style={{ marginBottom: "4em" }}
      >
        <Input
          freeSolo
          options={result.results}
          getOptionLabel={(option) => option.title}
          renderInput={(params) => <TextField {...params} variant="outlined" />}
          placeholder="Busque por sites"
          inputValue={search.term}
          onInputChange={(_e, v) => {
            setSearch((prevSearch) => ({
              ...prevSearch,
              term: v,
            }));
          }}
        />

        <Grid style={{ marginLeft: "1em" }}>
          <InputLabel>Assunto</InputLabel>
          <Select
            variant="outlined"
            value={search.query?.subject_name || ""}
            onChange={(e) =>
              setSearch((prevSearch) => ({
                ...prevSearch,
                query: !e.target.value ? {} : { subject_name: e.target.value },
              }))
            }
            style={{ minWidth: "15em" }}
          >
            <MenuItem value={null}>Nenhum</MenuItem>
            {subjects.map((item) => (
              <MenuItem key={item.id} value={item.name}>
                {item.name}
              </MenuItem>
            ))}
          </Select>
        </Grid>
      </Grid>

      <Grid item container direction="column">
        {result.results.map((item) => (
          <Item item>
            <Typography variant="subtitle1">
              <b>{item.title}</b>
            </Typography>
            <Grid container direction="row" alignItems="cenbter">
              {Array(5)
                .fill()
                .map((_item, index) =>
                  index <= item.stars ? <Star /> : <StarBorder />
                )}
            </Grid>
            <Typography variant="body1">{item.description}</Typography>
          </Item>
        ))}
      </Grid>
    </Grid>
  );
};
